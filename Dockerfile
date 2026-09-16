FROM node:20-alpine AS ffmpeg-source
RUN apk add --no-cache ffmpeg

FROM n8nio/n8n:latest
USER root
COPY --from=ffmpeg-source /usr/bin/ffmpeg /usr/bin/ffmpeg
COPY --from=ffmpeg-source /usr/bin/ffprobe /usr/bin/ffprobe
USER node
