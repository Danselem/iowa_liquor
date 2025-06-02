install-python:
	uv python install 3.10


init:
	uv venv --python 3.10
	uv init && rm hello.py
	uv tool install black

install:
	. .venv/bin/activate
	# uv pip install --all-extras --requirement pyproject.toml
	# uv pip sync requirements.txt
	uv add -r requirements.txt

kestra:
	cd orchestration && uv run docker compose up -d

debug-dbt:
	uv run dbt debug --project-dir analytics/liquor_sales_iowa

deps:
	uv run dbt deps --project-dir analytics/liquor_sales_iowa

dbt-build:
	uv run dbt build --vars '{"is_test_run": false}' --full-refresh --project-dir analytics/liquor_sales_iowa

delete:
	rm uv.lock pyproject.toml .python-version && rm -rf .venv

cdb:
	uv run -m src.scripts.create_db

load:
	uv run -m src.pipelines.load_data
