#!/bin/bash

d="${1:-.}"
  dev laravel:mk:storage "${d}"
#  dev chown:dev "${d}"
  dev chmod:r "${d}"
  dev chown:www "${d}/storage"
  dev chmod:w "${d}/storage"
  
  mkdir -p "${d}/storage/logs"
  mkdir -p "${d}/storage/app"
  mkdir -p "${d}/storage/framework/cache/data"
  mkdir -p "${d}/storage/framework/sessions"
  mkdir -p "${d}/storage/framework/testing"
  mkdir -p "${d}/storage/framework/views"
  dev chown:www "${d}/storage"
  dev chmod:w "${d}/storage"