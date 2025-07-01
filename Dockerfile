FROM python:3.11-slim

WORKDIR /app
#RUN apt-get update && \
#    apt-get install -y \
#    libcairo2 \
#    libpango-1.0-0 \
#    libpangoft2-1.0-0 \
#    libgdk-pixbuf2.0-0 \
#    libffi-dev && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*

# Copy project files
COPY pyproject.toml uv.lock ./

# Install dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir .

# Expose port
EXPOSE 8000

COPY main.py ./

# Command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
