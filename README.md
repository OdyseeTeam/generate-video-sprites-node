# generate-video-sprites-node

[![Docker Build](https://github.com/OdyseeTeam/generate-video-sprites-node/actions/workflows/docker.yml/badge.svg)](https://github.com/OdyseeTeam/generate-video-sprites-node/actions/workflows/docker.yml)
[![Docker Image](https://img.shields.io/docker/v/odyseeteam/transcoder-gensprite?label=docker&sort=semver)](https://hub.docker.com/r/odyseeteam/transcoder-gensprite)

Node.js package for generating video preview sprites and WebVTT files for video player scrubbing thumbnails. Also generates animated hover thumbnails.

## Requirements

- [Bun](https://bun.sh/) or Node.js
- ffmpeg/ffprobe installed on system

## Installation

```bash
bun install generate-video-sprites-node
```

## Features

### 1. Sprite Generation

Generates thumbnail sprites and WebVTT files for video player seek bar previews (like YouTube).

```bash
bun cli.js --input ./video.mp4 --outputFolder ./output --filename video
```

**Options:**
- `--input` (required) - Path to video file
- `--outputFolder` (required) - Output directory
- `--filename` (required) - Base name for output files
- `--interval` - Seconds between screenshots (default: 2)
- `--thumbnailSize` - Longest side in pixels (default: 140)
- `--targetSize` - Max sprite file size in KB before splitting (default: 80)
- `--columns` - Thumbnails per row (default: 9)
- `--prependPath` - Path prefix in VTT file (default: ".")
- `--debug` - Verbose logging, keeps intermediate files

**Output:** `{filename}-{n}.webp` sprite images + `{filename}_sprite.vtt`

### 2. Hover Thumbnail

Generates an animated `.webp` thumbnail from a 5-second clip at 2x speed.

```bash
bun generate-hover-thumbnail-cli.js --inputFilePath ./video.mp4 --outputFolder ./output --filename video
```

**Options:**
- `--inputFilePath` (required) - Path to video file
- `--outputFolder` (required) - Output directory
- `--filename` (required) - Output filename (produces `{filename}.webp`)
- `--debug` - Verbose logging, keeps intermediate files

## Programmatic Usage

```javascript
const createSpriteWithVTT = require('generate-video-sprites-node');

await createSpriteWithVTT({
  inputFilePath: './video.mp4',
  outputFileDirectory: './output',
  filename: 'video',
  spriteFileName: 'video_sprite.webp',
  spriteOutputFilePath: './output/video_sprite.webp',
  webVTTOutputFilePath: './output/video_sprite.vtt',
  intervalInSecondsAsInteger: 2,
  columns: 9,
  thumbnailLongestSide: 140,
  targetSizeInKb: 80,
  prependPath: '.',
  debug: false
});
```

## Docker

Pre-built images are available on Docker Hub:

```bash
docker pull odyseeteam/transcoder-gensprite:26.1.1
```

Or build locally:

```bash
docker build -t video-sprites .
```

## Development

```bash
# Install dependencies
bun install

# Run example
bun run example

# Start dev server for examples
bun run server
```
