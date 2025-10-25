# Instructions to produce the requested screenshots and run tests

This repository already contains a `Dockerfile`, but some environments expect a `yarn.lock` which is not present in this project. For local builds (Docker Desktop) use the included `Dockerfile.local` which does not require `yarn.lock`.

1) Build the Docker image (run from repository root):

```bash
docker build -f Dockerfile.local -t dockerwebsite:local .
```

2) Run the container mapping port 3000 to localhost:

```bash
docker run -d --name dockerwebsite-local -p 3000:3000 dockerwebsite:local
```

3) Open your browser to http://localhost:3000 and take a screenshot of your website running from the container.

4) Open Docker Desktop, go to Images — you should see `dockerwebsite:local` (take a screenshot).

5) In Docker Desktop, go to Containers / Apps — you should see the running container `dockerwebsite-local` (take a screenshot).

6) Stop and remove the container locally when done:

```bash
docker stop dockerwebsite-local && docker rm dockerwebsite-local
```

7) Codespaces screenshots
 - Open your repository in a Codespace.
 - Start the app in the Codespace terminal (from `getting-started-app`):

```bash
cd getting-started-app
npm install
npm run dev
```

 - In the Codespaces UI, open the forwarded port (3000) using the Ports / Forwarded Ports panel and click "Open in Browser" or "Preview in Browser". Take a screenshot of the website running inside Codespaces.
 - Take a screenshot of your repository's main page (GitHub) and the Actions tab showing workflow runs.

8) Python test files
 - Two simple pytest files were added to `python-tests/`:
   - `python-tests/test_home.py`
   - `python-tests/test_math.py`

Run them locally if you have Python and pytest installed:

```bash
python3 -m venv .venv && source .venv/bin/activate
pip install pytest
pytest python-tests -q
```

If you want, I can attempt to build and run the Docker image inside this Codespace and verify the HTTP response so you can skip some steps — tell me and I'll run the build and container here. Note: I cannot take or upload GUI screenshots from Docker Desktop or Codespaces; you will need to capture those yourself using your machine's screenshot tools.
