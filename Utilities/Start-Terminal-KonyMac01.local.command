#!/usr/bin/osascript
############################################################ {{{1 ###########
#  Copyright (C) 2007,2008  Martin Krischik
#############################################################################
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
#############################################################################
#  $Author: krischik@macports.org $
#  $Revision: 143806 $
#  $Date: 2015-12-22 14:08:15 +0100 (Di, 22. Dez 2015) $
#  $Id: Start-Terminal-KonyMac01.local.command 143806 2015-12-22 13:08:15Z krischik@macports.org $
#  $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Start-Terminal-KonyMac01.local.command $
############################################################ }}}1 ###########

tell application "Terminal"
    set |Tab| to do script "
	cd \"/Users/krma1/Work/Projects/MacPorts/Utilities\""
    set background color of |Tab| to {57344, 57344, 65535}
end tell

############################################################ {{{1 ###########
# vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=applescript foldmethod=marker nospell :
