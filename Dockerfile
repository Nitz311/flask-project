FROM python:3.12.0b3-alpine3.18
COPY . /applications
WORKDIR /applications
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 3001
CMD ["python", "app.py"]