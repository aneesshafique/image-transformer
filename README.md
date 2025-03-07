# Image Processing Application

This is a Ruby on Rails application that allows users to upload images and perform various image processing tasks, such as compression, conversion to PNG, and conversion to black and white.

## Features

- **Image Upload**: Users can upload JPEG images.
- **Image Compression**: Users can compress images by specifying a quality level (1-100).
- **Convert to PNG**: Users can convert uploaded images to PNG format.
- **Convert to Black and White**: Users can convert uploaded images to black and white.
- **ImageMagick Integration**: The app uses the `rmagick` gem for image processing.

## Prerequisites

Before you begin, ensure you have the following installed:

- **Ruby**: Version 3.2.1
- **Rails**: Version 7.1.3
- **ImageMagick**: Required for image processing.
  - **macOS**: `brew install imagemagick`
  - **Ubuntu**: `sudo apt-get install imagemagick`
- **PostgreSQL**: The app uses PostgreSQL as the database.

## Setup

### 1. Clone the Repository

```bash
git clone https://github.com/aneesshafique/image-transformer.git
```

### 2. Install Dependencies

Install the required Ruby gems:

```bash
bundle install
```

### 3. Set Up the Database

Create and migrate the database:

```bash
rails db:create
rails db:migrate
```

### 4. Install ImageMagick

Ensure ImageMagick is installed on your system. Follow the instructions for your operating system:

- **macOS**: `brew install imagemagick`
- **Ubuntu**: `sudo apt-get install imagemagick`

### 5. Start the Server

Run the Rails server:

```bash
rails server
```

Visit `http://localhost:3000` in your browser to access the application.

## Usage

### Upload an Image

1. Navigate to the home page.
2. Click on "Upload Image".
3. Select a JPEG file and click "Upload".

### Process an Image

After uploading an image, you can:

- **Compress the Image**: Specify a quality level (1-100) and click "Compress Image".
- **Convert to PNG**: Click "Convert to PNG" to convert the image to PNG format.
- **Convert to Black and White**: Click "Convert to Black and White" to convert the image to grayscale.

## Running Tests

The application uses RSpec for testing. To run the tests:

```bash
bundle exec rspec
```

---
