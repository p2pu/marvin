FROM python:3
WORKDIR /usr/local/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD [ "/usr/local/src/app/entry.sh", "netwell", "checks.py"]
