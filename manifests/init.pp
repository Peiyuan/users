# Class: users
#
# This module manages users
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class users {
  include users::admin
  include users::root
}
