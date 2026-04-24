FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

# Skip SSL verification for corporate network
RUN pip install --trusted-host pypi.org \
    --trusted-host pypi.python.org \
    --trusted-host files.pythonhosted.org \
    -r requirements.txt

COPY . .

EXPOSE 8080

CMD ["python", "app.py"]
