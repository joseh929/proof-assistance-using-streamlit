# app.py
import streamlit as st
from backend.coq_runner import run_query

st.set_page_config(page_title="Maize Disease Expert System", layout="centered")

st.title("🌽 Maize Disease Knowledge Base (Coq-Verified)")

st.markdown("Query the knowledge base. Results are **formally verified by Coq**.")

predicate = st.selectbox(
    "Select predicate",
    [
        "has_symptom",
        "indicates",
        "triggered_by",
        "risk_factor",
        "co_occurs",
        "severe_under",
        "mild_under"
    ]
)

arg1 = st.text_input("First argument (e.g. Rust, Yellowing, MLND)")
arg2 = st.text_input("Second argument (e.g. LeafSpots, HighHumidity)")

if st.button("Check Query"):
    if not arg1 or not arg2:
        st.warning("Please fill both arguments.")
    else:
        query = f"{predicate} {arg1} {arg2}."

        ok, error = run_query(query)

        if ok:
            st.success("✅ Query is PROVABLE in Coq")
        else:
            st.error("❌ Query is NOT provable")
            st.code(error)
