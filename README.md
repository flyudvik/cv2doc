# CV Generator API

A serverless API that generates CV Word documents from JSON data. The API directly converts JSON data to Word documents using python-docx.

## Features

- Accepts JSON data according to a predefined schema
- Validates the incoming data
- Directly converts JSON to a well-formatted Word document using python-docx
- Includes a placeholder for a photo in the contact information section
- Returns the binary Word document for download
- Containerized with Docker for easy deployment

## Requirements

- Python 3.11 or higher
- FastAPI
- Uvicorn
- python-docx
- Pydantic
- Docker (for containerized deployment)

## Installation

### Local Development

1. Clone the repository:
   ```
   git clone <repository-url>
   cd cv-to-doc
   ```

2. Install dependencies:
   ```
   pip install -e .
   ```

3. Run the application:
   ```
   uvicorn main:app --reload
   ```

### Docker Deployment

1. Build and run using Docker Compose:
   ```
   docker-compose up -d
   ```

2. The API will be available at http://localhost:8000

## API Documentation

### Endpoints

#### GET /

Returns a welcome message and basic usage instructions.

#### POST /generate-cv

Generates a CV Word document from the provided JSON data.

**Request:**
- Content-Type: application/json
- Body: JSON object conforming to the CV schema

**Response:**
- Content-Type: application/vnd.openxmlformats-officedocument.wordprocessingml.document
- Body: Binary Word document
- Content-Disposition: attachment; filename=<full_name>_CV.docx

### JSON Schema

The API accepts JSON data with the following structure:

```json
{
  "full_name": "John Doe",                 // Required
  "phone_number": "+1 123-456-7890",       // Required
  "phone_number_2": "+1 987-654-3210",     // Optional
  "email": "john.doe@example.com",         // Required
  "nationality": "American",               // Optional
  "position": "Software Engineer",         // Optional
  "employment": "looking",                 // Optional: "looking", "employed", or "freelance"
  "location": "New York, USA",             // Optional
  "skills": ["Python", "JavaScript"],      // Optional
  "work_experience": [                     // Optional
    {
      "position": "Senior Developer",
      "company_name": "Tech Solutions Inc.",
      "location": "San Francisco, CA",
      "responsibilities": "Developed and maintained web applications.",
      "period": "2018-01 - 2023-05"
    }
  ],
  "education": [                           // Optional
    {
      "institution": "MIT",
      "period_from": 2010,
      "period_to": 2014,
      "specialization": "Computer Science",
      "location": "Cambridge, MA",
      "location_of_graduation": "Cambridge, MA"
    }
  ],
  "language_proficiency": [                // Optional
    {
      "language": "English",
      "writing": 5,                        // 2-5 scale
      "speaking": 5,                       // 2-5 scale
      "understanding": 5                   // 2-5 scale
    }
  ],
  "marriage_status": "Single",             // Optional
  "have_children": "No",                   // Optional: "Yes" or "No"
  "date_of_birth": "1990-05-15",           // Optional
  "place_of_birth": "Chicago, IL",         // Optional
  "residency": {                           // Optional
    "city": "New York",
    "country": "USA"
  },
  "age": 33,                               // Optional
  "height": 180,                           // Optional, in cm
  "weight": 75                             // Optional, in kg
}
```

## Testing

You can test the API using the provided `test_main.http` file if you're using an IDE that supports HTTP request files (like VS Code with the REST Client extension).

Alternatively, you can use curl:

```bash
curl -X POST http://localhost:8000/generate-cv \
  -H "Content-Type: application/json" \
  -H "Accept: application/vnd.openxmlformats-officedocument.wordprocessingml.document" \
  -d @sample_data.json \
  --output cv.docx
```

## License

[MIT License](LICENSE)
