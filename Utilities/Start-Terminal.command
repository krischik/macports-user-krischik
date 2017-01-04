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
#  $Revision: 143884 $
#  $Date: 2015-12-24 21:02:29 +0100 (Do, 24. Dez 2015) $
#  $Id: Start-Terminal.command 143884 2015-12-24 20:02:29Z krischik@macports.org $
#  $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Start-Terminal.command $
############################################################ }}}1 ###########

tell application "Terminal"
    set |Tab| to do script "
	cd \"/Work/MacPorts/krischik/Utilities\""
    set background color of |Tab| to {57344, 57344, 65535}
end tell

############################################################ {{{1 ###########
# vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=applescript foldmethod=marker nospell :
