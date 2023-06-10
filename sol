CHATGPT soL
----------
Certainly! Here's a step-by-step walkthrough for writing unit test cases and deploying the Kanban board Flask application using Pytest and Docker Compose:

Step 1: Writing Unit Test Cases

1. Open a terminal and navigate to the `~/Desktop/Project/wingst5-may2023-s1h1` directory.
2. Create a new file named `test.py` in this directory.
3. Open the `test.py` file and import the necessary libraries for testing:

```python
import pytest
import requests
```

4. Write test cases to cover different aspects of the Kanban board Flask application. Here's an example of a test function to get you started:

```python
def test_create_task():
    # Make a POST request to the create task endpoint
    response = requests.post('http://localhost:5005/tasks', json={'title': 'Test Task'})

    # Assert that the response status code is 201 (Created)
    assert response.status_code == 201

    # Assert that the response JSON contains the created task
    assert 'Test Task' in response.json()['title']
```

5. Add more test functions to cover other endpoints and scenarios as needed.
6. Save and close the `test.py` file.

Step 2: Running Unit Tests

1. Ensure that you have the Flask application running. If not, open a terminal, navigate to the `~/Desktop/Project/wingst5-may2023-s1h1` directory, and run the Flask application:

```bash
export FLASK_APP=app.py
python3 -m flask run
```

2. Open another terminal window and navigate to the same directory.
3. Run the test cases using the command:

```bash
python3 -m pytest test.py
```

4. Observe the test results in the terminal. Refine and update the test cases as needed to achieve appropriate test coverage.

Step 3: Deploying the Kanban Board Flask Application using Docker Compose

1. Create a new file named `Dockerfile` in the `~/Desktop/Project/wingst5-may2023-s1h1` directory.
2. Open the `Dockerfile` and add the following content:

```Dockerfile
FROM python:3.7-alpine

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV FLASK_APP=app.py

EXPOSE 5005

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
```

3. Save and close the `Dockerfile`.

4. Create a new file named `docker-compose.yml` in the `~/Desktop/Project/wingst5-may2023-s1h1` directory.
5. Open the `docker-compose.yml` file and add the following content:

```yaml
version: '3'

services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: kanbanboard_app_container
    networks:
      - app_network
    ports:
      - '5005:5005'
    volumes:
      - app_volume:/app

networks:
  app_network:

volumes:
  app_volume:
```

6. Save and close the `docker-compose.yml` file.

Step 4: Deploying the Application using Docker Compose

1. Open a terminal and navigate to the `~/Desktop/Project/wingst5-may2023-s1h1` directory.
2. Run the following command to build and deploy the application using Docker Compose:

```bash
docker-compose up -d
``

`

3. Docker Compose will build the Docker image and start the container with the Kanban board application.
4. Once the container is up and running, you can visit `http://localhost:5005/` in your browser to ensure that the application is running successfully.

That's it! You have now successfully written unit test cases for the Kanban board Flask application using Pytest and deployed the application using Docker Compose.
