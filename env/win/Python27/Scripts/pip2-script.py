#!D:\Python27\python.exe
# EASY-INSTALL-ENTRY-SCRIPT: 'pip==9.0.1','console_scripts','pip2'
__requires__ = 'pip==9.0.1'
import sys
from pkg_resources import load_entry_point

sys.exit(
   load_entry_point('pip==9.0.1', 'console_scripts', 'pip2')()
)
