all:
	make pdf
	make docx

pdf:
	docker compose run --rm foliant make pdf --with pandoc

docx:
	docker compose run --rm foliant make docx --with pandoc
