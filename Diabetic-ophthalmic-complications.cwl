cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  diabetic-ophthalmic-complications-specified---primary:
    run: diabetic-ophthalmic-complications-specified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  diabetic-ophthalmic-complications-cataract---primary:
    run: diabetic-ophthalmic-complications-cataract---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: diabetic-ophthalmic-complications-specified---primary/output
  diabetic-ophthalmic-complications---primary:
    run: diabetic-ophthalmic-complications---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: diabetic-ophthalmic-complications-cataract---primary/output
  diabetic-ophthalmic-complications-mellitus---primary:
    run: diabetic-ophthalmic-complications-mellitus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: diabetic-ophthalmic-complications---primary/output
  exudative-diabetic-ophthalmic-complications---primary:
    run: exudative-diabetic-ophthalmic-complications---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: diabetic-ophthalmic-complications-mellitus---primary/output
  noninsulindependent-diabetic-ophthalmic-complications---primary:
    run: noninsulindependent-diabetic-ophthalmic-complications---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: exudative-diabetic-ophthalmic-complications---primary/output
  retinopathy-diabetic-ophthalmic-complications---primary:
    run: retinopathy-diabetic-ophthalmic-complications---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: noninsulindependent-diabetic-ophthalmic-complications---primary/output
  diabetic-ophthalmic-complications-prolif---primary:
    run: diabetic-ophthalmic-complications-prolif---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: retinopathy-diabetic-ophthalmic-complications---primary/output
  advanced-diabetic-ophthalmic-complications---primary:
    run: advanced-diabetic-ophthalmic-complications---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: diabetic-ophthalmic-complications-prolif---primary/output
  right-diabetic-ophthalmic-complications---primary:
    run: right-diabetic-ophthalmic-complications---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: advanced-diabetic-ophthalmic-complications---primary/output
  diabetic-ophthalmic-complications-background---primary:
    run: diabetic-ophthalmic-complications-background---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: right-diabetic-ophthalmic-complications---primary/output
  diabetic-ophthalmic-complications-manifestation---primary:
    run: diabetic-ophthalmic-complications-manifestation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: diabetic-ophthalmic-complications-background---primary/output
  maculopathy-diabetic-ophthalmic-complications---primary:
    run: maculopathy-diabetic-ophthalmic-complications---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: diabetic-ophthalmic-complications-manifestation---primary/output
  retinal-diabetic-ophthalmic-complications---primary:
    run: retinal-diabetic-ophthalmic-complications---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: maculopathy-diabetic-ophthalmic-complications---primary/output
  complications---primary:
    run: complications---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: retinal-diabetic-ophthalmic-complications---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: complications---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
