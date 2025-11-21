from fastapi.testclient import TestClient
from src.app import app

client = TestClient(app)

def test_read_main():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"Hello": "World"}

def test_read_item():
    response = client.get("/items/42")
    assert response.status_code == 200
    assert response.json()["item_id"] == 42

