#!/bin/sh
gunicorn core.wsgi -c ../gunicornconfig.py