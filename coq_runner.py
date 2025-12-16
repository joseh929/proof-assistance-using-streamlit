# backend/coq_runner.py
import subprocess
import tempfile
import shutil
from pathlib import Path

COQ_FILE = Path("coq/maize.v")

def run_query(query_statement: str):
    """
    query_statement example:
    has_symptom Rust LeafSpots.
    """

    with tempfile.TemporaryDirectory() as tmpdir:
        tmp_coq = Path(tmpdir) / "query.v"

        # Read base Coq file
        base_code = COQ_FILE.read_text()

        # Inject query
        injected = base_code.replace(
            "(* QUERY_HERE *)",
            f"""
Theorem user_query :
  {query_statement}
Proof.
  auto.
Qed.
"""
        )

        tmp_coq.write_text(injected)

        # Run Coq
        result = subprocess.run(
            ["coqc", tmp_coq.name],
            cwd=tmpdir,
            capture_output=True,
            text=True
        )

        return result.returncode == 0, result.stderr
