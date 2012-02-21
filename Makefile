#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License, Version 1.0 only
# (the "License").  You may not use this file except in compliance
# with the License.
#
# You can obtain a copy of the license at COPYING
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at COPYING.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright (c) 2011, Joyent Inc.
#
# To build everything just run 'gmake' in this directory.
#

PATH=/sbin:/usr/sbin:/usr/bin:/opt/SUNWspro/bin:/opt/local/bin
BASE=$(PWD)
DESTDIR=$(BASE)/proto
SUBDIRS= bash bzip2 curl g11n gcc gnupg gtar gzip less libexpat libidn libm \
	libxml libz ncurses node.js nss-nspr ntp openssl perl rsync screen \
	uuid vim wget

-include Makefile.inc

$(SUBDIRS): FRC
	cd $@; $(MAKE) DESTDIR=$(DESTDIR) install

install: $(SUBDIRS)

clean: 
	-for dir in $(SUBDIRS); do (cd $$dir; $(MAKE) DESTDIR=$(DESTDIR) clean); done
	-rm -rf proto

FRC:
