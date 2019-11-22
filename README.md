When installing a git dependency using the Docker image node:10-alpine via `npm ci`, attempts to `npm prune --production` result in an error like:
```
npm ERR! code 128
npm ERR! Command failed: git clone --mirror -q https://github.com/nodecraft/ampify.git /root/.npm/_cacache/tmp/git-clone-6573274f/.git
npm ERR! fatal: could not create leading directories of '/root/.npm/_cacache/tmp/git-clone-6573274f/.git'
```

To help replicate the issue, this repo contains a `package.json` and `package-lock.json`. I then have a `Dockerfile` which when building, illustrates the issue.

To build the image, simply run: `docker build -t test .`

You can tweak the npm version to see it working/failing on different version on line 3 of the `Dockerfile`.

For more information, see the reported issue at: https://github.com/npm/cli/issues/514