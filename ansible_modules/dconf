#!/usr/bin/python
# -*- coding: utf-8 -*-

# (c) 2014, Joseph Kahn <josephbkahn@gmail.com>
#
# This file is part of Ansible
#
# Ansible is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Ansible is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Ansible.  If not, see <http://www.gnu.org/licenses/>.

from ansible.constants import mk_boolean
from ansible.module_utils.basic import *

DOCUMENTATION = '''
---
module: dconf
version_added: "post 1.7.1"
author: Joseph Kahn
short_description: alter dconf controlled settings.
description:
   - Set the value of a dconf controlled setting using a key and a string, an integer, or a boolean.
options:
  key:
    description:
      - The key of the dconf setting to change.
    required: true
  bool:
    description:
      - The boolean value to set the key to.
    required: false
  int:
    description:
      - The integer value to set the key to.
    required: false
  string:
    description:
      - The string value to set the key to. Wrap it in single quotes for safety.
    required: false
  float:
    description:
      - The float value to set the key to.
    required: false
'''

EXAMPLES = '''
# Set string value
- dconf: key=/apps/gnome-terminal/global/default_profile string=base-16-monokai-dark

# Set bool value
- dconf: key=/apps/gnome-terminal/profiles/base-16-monokai-dark/use_system_font bool=false
'''

# ===========================================
# Module code.
#


def _set_value(module, key, value):
    """Set value of setting, under `key`, using dconf to `value`."""
    return module.run_command(" ".join(['dconf write {} {}'.format(key, value)]))


def _get_value(module, key):
    """Return value of setting, under `key`, from dconf."""
    return module.run_command('dconf read {}'.format(key))[1].strip()


def main():

    module = AnsibleModule(
        argument_spec={
            'key': {'required': True},
            'bool': {'type': 'bool'},
            'int': {'type': 'int'},
            'string': {'type': 'str'},
            'float': {'type': 'float'},
        },
        mutually_exclusive=[
            ['bool', 'string', 'int', 'float'],
        ],
        required_one_of=[['bool', 'string', 'int', 'float']],
        supports_check_mode=True
    )

    key = module.params['key']
    boolean_value = module.params['bool']
    string_value = module.params['string']
    integer_value = module.params['int']
    float_value = module.params['float']

    old_value = _get_value(module, key)

    if boolean_value is not None:
        value = str(mk_boolean(boolean_value)).lower()
        old_value = str(mk_boolean(old_value)).lower()
    elif integer_value is not None:
        value = int(integer_value)
    elif string_value is not None:
        value = string_value
    elif float_value is not None:
        value = float_value

    changed = old_value != str(value)

    if changed and not module.check_mode:
        _set_value(module, key, value)

    module.exit_json(
        changed=changed,
        key=key,
        value=value,
        old_value=old_value
    )

main()
