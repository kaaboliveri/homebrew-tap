# homebrew-tap

Homebrew tap for the [Tanya](https://github.com/kaaboliveri/tanya-godlike-ai) CLI.

## Install

```bash
brew tap kaaboliveri/tap
brew install tanya
```

## Usage

```bash
tanya help
tanya version
tanya health
tanya chat "hello"
tanya skills search keyword
tanya synthesis "summarize my week"
```

Configure the brain-server endpoint and auth token via env vars or
`~/.config/tanya/config`:

```bash
export TANYA_BASE_URL="https://tanya-brain-server.onrender.com"
export TANYA_API_TOKEN="<your-token>"
```

Or in `~/.config/tanya/config`:

```
base_url=https://tanya-brain-server.onrender.com
token=<your-token>
```

## Upgrade

```bash
brew update
brew upgrade tanya
```

## License

[MIT](./LICENSE) — the CLI shim is open source. The brain-server it
talks to is hosted separately and has its own access policy.
