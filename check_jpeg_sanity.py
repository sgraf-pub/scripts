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


def delete_jpeg(jpeg_file):
    print 'rm -f "%s"' % jpeg_file
    run('rm -f "%s"' % jpeg_file)


def fix_jpeg(jpeg_file):
    print 'mogrify -format jpg "%s"' % jpeg_file
    run('mogrify -format jpg "%s"' % jpeg_file)
    [exit_code, output] = run('jpeginfo --check "%s"' % jpeg_file)
    if exit_code != 0:
        delete_jpeg(jpeg_file)


def main():
    parser = make_parser()
    (parsed, _) = parser.parse_args()
    if parsed.path:
        [_, search_result] = run("find '%s' -type f -name '*.jpg' -o -name '*.jpeg' -o -name '*.JPG' -o -name '*.JPEG'" % parsed.path)
    else:
        sys.exit(1)

    for line in search_result.split('\n'):
        [exit_code, output] = run('jpeginfo --check "%s"' % line)
        if exit_code == 0:
            continue

        print output,

        if "Not a JPEG file: starts with" in output:
            [_, filetype] = run('file --mime "%s" | cut -d":" -f2' % line)
            if filetype.strip().startswith('image/'):
                #if parsed.action:
                #    fix_jpeg(line)
                continue
            if parsed.action:
                delete_jpeg(line)
            continue

        if "Empty input file" in output:
            if parsed.action:
                delete_jpeg(line)
            continue

        if parsed.action:
            fix_jpeg(line)

main()
