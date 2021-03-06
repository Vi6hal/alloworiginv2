from python:3.8-bullseye

# Section 2- Python Interpreter Flags
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# COPY app /opt/app
COPY . /opt/data
COPY requirements.txt /tmp/requirements.txt
WORKDIR /opt/data/app
RUN pip install --upgrade pip && pip install -r /tmp/requirements.txt
RUN ls
RUN \
    python manage.py makemigrations && \
    python manage.py migrate --no-input && \
    python manage.py collectstatic --no-input
RUN chmod +x ../startup.sh 
EXPOSE 8000
CMD ["../startup.sh"]