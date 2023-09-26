FROM oven/bun:1.0.3

WORKDIR /usr/src/app

COPY index.ts .

EXPOSE 3000

CMD ["bun", "index.ts"]