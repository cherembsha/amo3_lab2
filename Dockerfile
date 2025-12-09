FROM apache/airflow:3.0.0

WORKDIR /app

RUN python -m venv venv

ENV VIRTUAL_ENV=/app/venv
ENV PATH="/app/venv/bin:$PATH"

COPY requirements.txt .
RUN  pip install --upgrade pip
RUN pip install -r requirements.txt

COPY dags/ /opt/airflow/dags/

ENTRYPOINT ["airflow"]
CMD ["standalone"]