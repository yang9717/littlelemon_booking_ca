#!/usr/bin/env bash
# exit on error
set -o errexit

pip install -r requirements.txt

# To create Django admin account
if [[ $CREATE_SUPERUSER ]];
then
  python manage.py createsuperuser --no-input
fi

mkdir -p staticfiles

python manage.py collectstatic --no-input
python manage.py migrate