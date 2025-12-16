(*
  Maize Diseases Knowledge Base in Coq
  ------------------------------------
  *)

Inductive Disease :=
  | MLND
  | Rust
  | Blight
  | Smut
  | DownyMildew
  | GrayLeafSpot
  | Anthracnose
  | RootRot
  | EarRot
  | CommonBunt
  | StalkRot
  | ViralStreak
  | LeafCurl
  | Wilt
  | StripeDisease
  | ChlorosisComplex
  | MosaicVirus
  | FusariumWilt
  | AspergillusRot
  | DiplodiaEarRot.

Inductive Symptom :=
  | Yellowing
  | Necrosis
  | LeafSpots
  | StemBreakage
  | EarDiscoloration
  | WhiteFungalGrowth
  | RustPustules
  | MoldyKernels
  | Wilting
  | Curling
  | Streaks
  | SoftRot
  | Blisters
  | PowderyGrowth
  | WaterSoaking
  | DampingOff
  | GrayLesions
  | DeadTissue
  | StuntedGrowth
  | Browning.

Inductive Condition :=
  | HighHumidity
  | LowHumidity
  | ModerateHumidity
  | HighTemp
  | LowTemp
  | WetSoils
  | PoorDrainage
  | Drought
  | InsectVector
  | DensePlanting
  | PoorFertility
  | LatePlanting
  | EarlyPlanting
  | ContaminatedSeed
  | MechanicalInjury.


(* ----------------------------- *)
(* 2. Predicates                 *)
(* ----------------------------- *)

Inductive has_symptom : Disease -> Symptom -> Prop := .
Inductive indicates : Symptom -> Disease -> Prop := .
Inductive triggered_by : Disease -> Condition -> Prop := .
Inductive risk_factor : Disease -> Condition -> Prop := .
Inductive co_occurs : Disease -> Disease -> Prop := .
Inductive severe_under : Disease -> Condition -> Prop := .
Inductive mild_under : Disease -> Condition -> Prop := .

(* Logical implication wrapper *)
Inductive implies_rule : Prop -> Prop -> Prop :=
  mk_implication : forall A B, (A -> B) -> implies_rule A B.


(* ----------------------------- *)
(* 3. Facts —  Rules         *)
(* ----------------------------- *)

(* 3A — Disease → Symptom Facts (30) *)
Axiom hs1  : has_symptom MLND Yellowing.
Axiom hs2  : has_symptom MLND Necrosis.
Axiom hs3  : has_symptom MLND StuntedGrowth.
Axiom hs4  : has_symptom Rust RustPustules.
Axiom hs5  : has_symptom Rust LeafSpots.
Axiom hs6  : has_symptom Blight LeafSpots.
Axiom hs7  : has_symptom Blight DeadTissue.
Axiom hs8  : has_symptom Smut Blisters.
Axiom hs9  : has_symptom Smut MoldyKernels.
Axiom hs10 : has_symptom DownyMildew WhiteFungalGrowth.
Axiom hs11 : has_symptom DownyMildew WaterSoaking.
Axiom hs12 : has_symptom GrayLeafSpot GrayLesions.
Axiom hs13 : has_symptom GrayLeafSpot DeadTissue.
Axiom hs14 : has_symptom Anthracnose DeadTissue.
Axiom hs15 : has_symptom RootRot SoftRot.
Axiom hs16 : has_symptom RootRot Browning.
Axiom hs17 : has_symptom EarRot MoldyKernels.
Axiom hs18 : has_symptom EarRot EarDiscoloration.
Axiom hs19 : has_symptom StalkRot StemBreakage.
Axiom hs20 : has_symptom ViralStreak Streaks.
Axiom hs21 : has_symptom LeafCurl Curling.
Axiom hs22 : has_symptom Wilt Wilting.
Axiom hs23 : has_symptom StripeDisease Streaks.
Axiom hs24 : has_symptom ChlorosisComplex Yellowing.
Axiom hs25 : has_symptom MosaicVirus Yellowing.
Axiom hs26 : has_symptom FusariumWilt Wilting.
Axiom hs27 : has_symptom AspergillusRot MoldyKernels.
Axiom hs28 : has_symptom DiplodiaEarRot MoldyKernels.
Axiom hs29 : has_symptom DiplodiaEarRot EarDiscoloration.
Axiom hs30 : has_symptom Anthracnose Browning.


(* 3B — Symptom → Disease (Indication Rules) (20) *)

Axiom ind1  : indicates Yellowing ChlorosisComplex.
Axiom ind2  : indicates Yellowing MLND.
Axiom ind3  : indicates Necrosis MLND.
Axiom ind4  : indicates RustPustules Rust.
Axiom ind5  : indicates LeafSpots Blight.
Axiom ind6  : indicates LeafSpots Rust.
Axiom ind7  : indicates MoldyKernels EarRot.
Axiom ind8  : indicates MoldyKernels AspergillusRot.
Axiom ind9  : indicates WaterSoaking DownyMildew.
Axiom ind10 : indicates GrayLesions GrayLeafSpot.
Axiom ind11 : indicates Blisters Smut.
Axiom ind12 : indicates SoftRot RootRot.
Axiom ind13 : indicates Streaks ViralStreak.
Axiom ind14 : indicates Streaks StripeDisease.
Axiom ind15 : indicates Curling LeafCurl.
Axiom ind16 : indicates Wilting Wilt.
Axiom ind17 : indicates Wilting FusariumWilt.
Axiom ind18 : indicates Browning RootRot.
Axiom ind19 : indicates DeadTissue Anthracnose.
Axiom ind20 : indicates GrayLesions GrayLeafSpot.


(* 3C — Conditions Trigger Diseases (20) *)
Axiom tr1  : triggered_by MLND InsectVector.
Axiom tr2  : triggered_by Rust HighHumidity.
Axiom tr3  : triggered_by Rust ModerateHumidity.
Axiom tr4  : triggered_by Blight HighHumidity.
Axiom tr5  : triggered_by DownyMildew HighHumidity.
Axiom tr6  : triggered_by DownyMildew WetSoils.
Axiom tr7  : triggered_by GrayLeafSpot HighTemp.
Axiom tr8  : triggered_by Smut ContaminatedSeed.
Axiom tr9  : triggered_by RootRot PoorDrainage.
Axiom tr10 : triggered_by RootRot WetSoils.
Axiom tr11 : triggered_by EarRot HighHumidity.
Axiom tr12 : triggered_by EarRot MechanicalInjury.
Axiom tr13 : triggered_by Wilt Drought.
Axiom tr14 : triggered_by LeafCurl InsectVector.
Axiom tr15 : triggered_by MosaicVirus InsectVector.
Axiom tr16 : triggered_by FusariumWilt WetSoils.
Axiom tr17 : triggered_by StalkRot HighTemp.
Axiom tr18 : triggered_by Anthracnose HighHumidity.
Axiom tr19 : triggered_by AspergillusRot HighTemp.
Axiom tr20 : triggered_by DiplodiaEarRot HighHumidity.

(* 3D — Risk Factors (15) *)
Axiom rf1  : risk_factor MLND LatePlanting.
Axiom rf2  : risk_factor MLND DensePlanting.
Axiom rf3  : risk_factor Rust HighHumidity.
Axiom rf4  : risk_factor Blight HighHumidity.
Axiom rf5  : risk_factor DownyMildew WetSoils.
Axiom rf6  : risk_factor GrayLeafSpot HighTemp.
Axiom rf7  : risk_factor Smut ContaminatedSeed.
Axiom rf8  : risk_factor RootRot PoorDrainage.
Axiom rf9  : risk_factor EarRot HighHumidity.
Axiom rf10 : risk_factor Wilt Drought.
Axiom rf11 : risk_factor MosaicVirus InsectVector.
Axiom rf12 : risk_factor FusariumWilt PoorDrainage.
Axiom rf13 : risk_factor StalkRot HighTemp.
Axiom rf14 : risk_factor DiplodiaEarRot MechanicalInjury.
Axiom rf15 : risk_factor AspergillusRot HighTemp.

(* 3E — Co-occurrence Rules (10) *)
Axiom co1  : co_occurs Rust GrayLeafSpot.
Axiom co2  : co_occurs EarRot AspergillusRot.
Axiom co3  : co_occurs Smut EarRot.
Axiom co4  : co_occurs DownyMildew Blight.
Axiom co5  : co_occurs RootRot FusariumWilt.
Axiom co6  : co_occurs MLND MosaicVirus.
Axiom co7  : co_occurs Anthracnose GrayLeafSpot.
Axiom co8  : co_occurs StalkRot RootRot.
Axiom co9  : co_occurs DiplodiaEarRot AspergillusRot.
Axiom co10 : co_occurs Blight Rust.

(* 3F — Severity Rules (10) *)
Axiom sev1  : severe_under MLND HighHumidity.
Axiom sev2  : severe_under Rust HighHumidity.
Axiom sev3  : severe_under DownyMildew WetSoils.
Axiom sev4  : severe_under GrayLeafSpot HighTemp.
Axiom sev5  : severe_under StalkRot HighTemp.
Axiom sev6  : severe_under EarRot HighHumidity.
Axiom sev7  : severe_under FusariumWilt WetSoils.
Axiom sev8  : severe_under Anthracnose HighHumidity.
Axiom sev9  : severe_under DiplodiaEarRot HighHumidity.
Axiom sev10 : severe_under AspergillusRot HighTemp.



(* ----------------------------- *)
(* 4. Inference Rules (15)       *)
(* ----------------------------- *)

Theorem rule1 :
  forall D S, has_symptom D S -> indicates S D.
Proof. Admitted.

Theorem rule2 :
  forall D C, triggered_by D C -> risk_factor D C.
Proof. Admitted.

Theorem rule3 :
  forall D1 D2 C, triggered_by D1 C -> co_occurs D1 D2 -> triggered_by D2 C.
Proof. Admitted.

Theorem rule4 :
  forall D S C, has_symptom D S -> triggered_by D C -> severe_under D C.
Proof. Admitted.

Theorem rule5 :
  forall D C, risk_factor D C -> severe_under D C.
Proof. Admitted.

Theorem rule6 :
  forall S1 S2 D, indicates S1 D -> indicates S2 D -> has_symptom D S1.
Proof. Admitted.

Theorem rule7 :
  forall D S C, has_symptom D S -> severe_under D C -> indicates S D.
Proof. Admitted.

Theorem rule8 :
  forall D S C, has_symptom D S -> severe_under D C -> indicates S D.
Proof. Admitted.

Theorem rule9 :
  forall D C1 C2, triggered_by D C1 -> risk_factor D C2 -> severe_under D C1.
Proof. Admitted.

Theorem rule10 :
  forall D S, has_symptom D S -> indicates S D.
Proof. Admitted.

Theorem rule11 :
  forall D C, severe_under D C -> triggered_by D C.
Proof. Admitted.

Theorem rule12 :
  forall D1 D2 S, has_symptom D1 S -> co_occurs D1 D2 -> has_symptom D2 S.
Proof. Admitted.

Theorem rule13 :
  forall D S C, indicates S D -> risk_factor D C -> severe_under D C.
Proof. Admitted.

Theorem rule14 :
  forall D C, triggered_by D C -> severe_under D C.
Proof. Admitted.

Theorem rule15 :
  forall S D1 D2, indicates S D1 -> co_occurs D1 D2 -> indicates S D2.
Proof. Admitted.


(* ----------------------------- *)
(* 5. Example Queries             *)
(* ----------------------------- *)

Theorem query1 :
  has_symptom Rust LeafSpots.
Proof. apply hs5. Qed.

Theorem query2 :
  indicates Streaks ViralStreak.
Proof. apply ind13. Qed.

Theorem query3 :
  triggered_by DownyMildew WetSoils.
Proof. apply tr6. Qed.

Theorem query4 :
  severe_under FusariumWilt WetSoils.
Proof. apply sev7. Qed.

Theorem query5 :
  co_occurs Rust GrayLeafSpot.
Proof. apply co1. Qed.

(* ----------------------------- *)
(* 6. Test Checks                 *)
(* ----------------------------- *)

Check has_symptom MLND Yellowing.
Check indicates Streaks ViralStreak.
Check triggered_by DownyMildew WetSoils.

Theorem test1 : has_symptom MLND Yellowing.
Proof.
  apply hs1.
Qed.

Theorem test2 : indicates Streaks ViralStreak.
Proof.
  apply ind13.
Qed.

Theorem test3 : triggered_by DownyMildew WetSoils.
Proof.
  apply tr6.
Qed.

Theorem my_theorem : has_symptom MLND Yellowing.
Proof.
  apply hs1.
Qed.

Theorem derived1 :
  has_symptom Rust LeafSpots -> indicates LeafSpots Rust.
Proof.
  apply rule1.
Qed.

(* AUTO-GENERATED QUERY *)
(* QUERY_HERE *)
