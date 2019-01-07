#!/bin/sh

sudo debsecan -- suite wheezy | grep 'remotely exploitable' | grep 'high urgency' | grep -v fixed | sort
