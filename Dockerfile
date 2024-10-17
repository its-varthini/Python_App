FROM python:3.8
WORKDIR /code
COPY requirements.txt .
ENV PYTHONUNBUFFERED=1
RUN pip install -r requirements.txt
COPY quotes.py .
EXPOSE 9090
CMD [ "python", "./quotes.py" ]
