# Do not use extensions
SET(LOCAL_FILES
    doc-pgr_bdAstarCostMatrix
    doc-pgr_bdAstarCost
    doc-pgr_bdAstar
    )

foreach (f ${LOCAL_FILES})
    configure_file("${f}.result" "${PGR_DOCUMENTATION_SOURCE_DIR}/${f}.queries")
    list(APPEND LOCAL_DOC_FILES  "${PGR_DOCUMENTATION_SOURCE_DIR}/${f}.queries")
endforeach()

set(PGROUTING_DOC_FILES ${PGROUTING_DOC_FILES} ${LOCAL_DOC_FILES} PARENT_SCOPE)
