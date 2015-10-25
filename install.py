#!/usr/bin/python
import os
import sys
import glob
import urllib
import shutil
import argparse


ROOT = os.getcwd()

def mklink(src, dest, force=False):
    print src, dest, force, os.path.exists(dest)
    if os.path.lexists(dest) and not force:
        print "{0}: Already exists".format(dest)
        return
    elif os.path.lexists(dest) and force:
        print "Removing {0}".format(dest)
        if os.path.islink(dest):
            os.unlink(dest)
        elif os.path.isdir(dest):
            shutil.rmtree(dest)
        else:
            os.unlink(dest)

    try:
        os.symlink(src, dest)
    except OSError, e:
        print "{0}: Already exists".format(dest)
        print e
        return
    print "Created link {0}".format(dest)


def cp(src, dest, force=False):
    if os.path.exists(dest) and not force:
        print "{0}: Already exists".format(dest)
        return
    elif os.path.exists(dest) and force:
        print "Removing {0}".format(dest)
        if os.path.islink(dest):
            os.unlink(dest)
        elif os.path.isdir(dest):
            shutil.rmtree(dest)
        else:
            os.unlink(dest)

    try:
        shutil.copy(src, dest)
    except OSError, e:
        print "{0}: Already exists".format(dest)
        return
    print "File Copied {0}".format(dest)


def emacs(force=False):
    """Install Emacs dot files"""
    emacs_dir = os.path.join(ROOT, 'emacs')
    emacs_link = os.path.expanduser('~/.emacs.d')
    mklink(emacs_dir, emacs_link, force)


def bash(force=False):
    """Install Bash dot files"""
    bash_dir = os.path.join(ROOT, 'bash')
    bashp_file = os.path.join(bash_dir, 'bash_profile.sh')
    bashp_link = os.path.expanduser('~/.bash_profile')
    mklink(bashp_file, bashp_link, force)

    bashrc_file = os.path.join(bash_dir, 'bashrc.sh')
    bashrc_link = os.path.expanduser('~/.bashrc')
    mklink(bashrc_file, bashrc_link, force)

    bashrc_file = os.path.join(bash_dir, 'inputrc.sh')
    bashrc_link = os.path.expanduser('~/.inputrc')
    mklink(bashrc_file, bashrc_link, force)


def xmodmap(force=False):
    xmodmap_file = os.path.join(ROOT, 'xmodmap')
    xmodmap_link = os.path.expanduser('~/.Xmodmap')
    mklink(xmodmap_file, xmodmap_link, force)


def fonts(font_dir='~/Library/Fonts', force=False):
    font_install_location = os.path.expanduser(font_dir)
    try:
        os.makedirs(font_install_location)
    except OSError:
        pass
    for filepath in glob.glob(os.path.join(ROOT, 'ubuntu_mono_powerline', '*.otf')):
        filename = os.path.basename(filepath)
        file_dest = os.path.join(font_install_location, filename)
        cp(filepath, file_dest, force)


def tcsh(force=False):
    """Install Tcsh dot files"""
    tcsh_dir = os.path.join(ROOT, 'tcsh')
    tcsh_file = os.path.join(tcsh_dir, 'tcshrc')
    tcsh_link = os.path.expanduser('~/.tcshrc')
    mklink(tcsh_file, tcsh_link, force)


def hg(force=False):
    """Install Mercurial dot files"""
    hg_dir = os.path.join(ROOT, 'hg')
    hgrc_file = os.path.join(hg_dir, 'hgrc')
    hgrc_link = os.path.expanduser('~/.hgrc')
    mklink(hgrc_file, hgrc_link, force)

    hgignore_file = os.path.join(hg_dir, 'hgignore')
    hgignore_link = os.path.expanduser('~/.hgignore')
    mklink(hgignore_file, hgignore_link, force)


def git(force=False):
    """Install git dot files"""
    git_dir = os.path.join(ROOT, 'git')
    gitconfig_file = os.path.join(git_dir, 'gitconfig')
    gitconfig_link = os.path.expanduser('~/.gitconfig')
    mklink(gitconfig_file, gitconfig_link, force)

    gitignore_file = os.path.join(git_dir, 'gitignore')
    gitignore_link = os.path.expanduser('~/.gitignore')
    mklink(gitignore_file, gitignore_link, force)


def ipython(force=False):
    """Install IPython dot files"""
    ipython_dir = os.path.join(ROOT, 'ipython')
    ipython_link = os.path.expanduser('~/.ipython')
    mklink(ipython_dir, ipython_link, force)


def iterm(force=False):
    iterm_file = os.path.join(ROOT, 'iterm', 'com.googlecode.iterm2.plist')
    iterm_link = os.path.expanduser('~/Library/Preferences/com.googlecode.iterm2.plist')
    mklink(iterm_file, iterm_link, force)


def sublime(force=False, sublime_settings_dir='~/Library/Application Support/Sublime Text 2/Packages/User'):
    """Install Sublime settings"""
    install_location = os.path.expanduser(sublime_settings_dir)
    sublime_settings = os.path.join(ROOT, 'sublime_text_2', 'settings')
    for filepath in glob.glob(os.path.join(sublime_settings, '*.sublime-*')):
        filename = os.path.basename(filepath)
        file_link = os.path.join(install_location, filename)
        mklink(filepath, file_link, force)


def goprompt(force=False):
    goprompt_file = os.path.join(ROOT, 'go_prompt')
    goprompt_link = os.path.expanduser('~/.go_prompt')
    mklink(goprompt_file, goprompt_link, force)

    bin_install = os.path.expanduser('~/bin/go-prompt')
    try:
        os.makedirs(os.path.expanduser('~/bin/'))
    except OSError:
        pass
    open(bin_install, 'w').close()
    urllib.urlretrieve('https://github.com/brandonvfx/go-prompt/releases/download/v0.1.1/go-prompt_linux_amd64.tar.gz', bin_install)
    os.chmod(bin_install, 0755)


def atom(force=False):
    """Install atom config files"""
    install_location = os.path.expanduser('~/.atom')
    atom_settings = os.path.join(ROOT, 'atom')
    for filepath in glob.glob(os.path.join(atom_settings, '*')):
        filename = os.path.basename(filepath)
        file_link = os.path.join(install_location, filename)
        mklink(filepath, file_link, force)


def osx_all(force=False):
    """Install Emacs, Bash, Tcsh, Mercurial, git, IPython dot files"""
    emacs(force)
    bash(force)
    tcsh(force)
    hg(force)
    git(force)
    ipython(force)
    sublime(force)
    fonts('~/Library/Fonts', force)
    goprompt(force)
    atom(force)


def linux_all(force=False):
    """Install Emacs, Bash, Tcsh, Mercurial, git, IPython dot files"""
    emacs(force)
    bash(force)
    hg(force)
    git(force)
    ipython(force)
    fonts('~/.fonts', force)
    sublime(force, '~/.config/sublime-text-2/Packages/User')
    xmodmap(force)
    goprompt(force)
    atom(force)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-f', '--force', help='Install over existing files.', action='store_true', default=False)
    args = parser.parse_args()

    platform = sys.platform

    if platform.startswith('darwin'):
        osx_all(args.force)
    elif platform.startswith('linux'):
        print platform, 'install. Force? ', args.force
        linux_all(args.force)

    else:
        print 'Unsupported OS: {}'.format(platform)
