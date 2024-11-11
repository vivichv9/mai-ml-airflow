FROM python:3.8

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# Copy to container init script
RUN mkdir /project
COPY scripts/entrypoint.sh /project/scripts/
RUN chmod +x /project/scripts/entrypoint.sh

# Exec init script
ENTRYPOINT ["/project/scripts/entrypoint.sh"]