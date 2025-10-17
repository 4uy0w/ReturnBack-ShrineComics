#!/usr/bin/bash

# ini adalah skrip untuk menjalankan server PHP website

# konfigurasi server
PORT=8000
HOST=127.0.0.1
PREFIX=.
FULL_HOST=$HOST:$PORT
SERVER=php
FLAG_SERVER=-S
FLAG_PREFIX=-d

# menjalankan server
$SERVER $FLAG_SERVER $FULL_HOST $FLAG_PREFIX $PREFIX
