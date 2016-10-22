#!/usr/bin/env python

import optparse
import subprocess
import sys

def run(cmd):
    """
    Run command in shell.
    :param cmd: command to run
    :return: exit_code, output
    """
    proc = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT)
    output, dummy = proc.communicate()
    return proc.returncode, output


def make_parser():
    """
    Define valid options and defaults
    """
    parser = optparse.OptionParser()
    parser.add_option("--action", action="store_true")
    parser.add_option("--path", default=None)
    return parser


def delete_file(some_file):
    print 'rm -f "%s"' % some_file
    run('rm -f "%s"' % some_file)


def main():
    parser = make_parser()
    (parsed, _) = parser.parse_args()

    # get ext/mime dict
    [exit_code, ext_mime_list] = run("""wget -qO- http://svn.apache.org/repos/asf/httpd/httpd/trunk/docs/conf/mime.types | egrep -v ^# | awk '{ for (i=2; i<=NF; i++) {print $i" "$1}}' | sort""")
    if exit_code != 0:
        sys.exit(1)

    ext_mime_dict = {}
    for line in ext_mime_list.split('\n'):
        if line:
            ext_mime_dict[line.split()[0]] = line.split()[1]

    if parsed.path:
        [_, search_result] = run("find '%s' -type f" % parsed.path)
    else:
        sys.exit(1)

    for line in search_result.split('\n'):
        if line:
            ext = line.split('.')[-1:][0]
            try:
                ext_mime_dict[ext]
            except KeyError:
                continue

            if ext_mime_dict[ext].startswith('audio/') or ext_mime_dict[ext].startswith('video/') or ext_mime_dict[ext].startswith('image/'):
                [exit_code, _] = run('ls "%s"'% line)
                if exit_code != 0:
                    continue
                [_, filetype] = run('file --mime-type --brief "%s"' % line)
                if not ext_mime_dict[ext].startswith(filetype.strip('\n')):
                    if (
                        (filetype.strip('\n').startswith('image/') and ext_mime_dict[ext].startswith('image/')) or
                        (filetype.strip('\n').startswith('video/') and (ext_mime_dict[ext].startswith('video/') or ext_mime_dict[ext].startswith('audio/'))) or
                        (filetype.strip('\n').startswith('audio/') and (ext_mime_dict[ext].startswith('video/') or ext_mime_dict[ext].startswith('audio/'))) or
                        (filetype.strip('\n') == 'text/plain' and ext_mime_dict[ext] == 'audio/x-mpegurl') or
                        (filetype.strip('\n') == 'text/plain' and ext_mime_dict[ext] == 'audio/vnd.dts') or
                        ((filetype.strip('\n') == 'application/xml' or filetype.strip('\n') == 'text/plain') and ext_mime_dict[ext] == 'image/svg+xml') or
                        (filetype.strip('\n') == 'application/octet-stream' and ext_mime_dict[ext] == 'image/x-3ds')
                    ):
                        continue

                    if filetype.strip('\n') == 'application/octet-stream' and ext_mime_dict[ext].startswith('audio/'):
                        [exit_code, _] = run('ffprobe "%s" 2>&1 | grep "Stream.*Audio:"' % line)
                        if exit_code == 0:
                            continue

                    if filetype.strip('\n') == 'application/octet-stream' and ext_mime_dict[ext].startswith('video/'):
                        [exit_code, _] = run('ffprobe "%s" 2>&1 | grep "Stream.*Video:"' % line)
                        if exit_code == 0:
                            continue

                    print "'%s' '%s' '%s'" % (line, filetype.strip('\n'), ext_mime_dict[ext])

                    if parsed.action:
                        delete_file(line)

main()
