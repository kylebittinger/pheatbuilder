x <- matrix(1:9, nrow=3, dimnames = list(c("a", "b", "c"), c("x", "y", "z")))

test_that("pheat_cluster_rows turns on clustering", {
  ph <- pheat(x)
  expect_false(ph$cluster_rows)

  ph <- pheat_cluster_rows(ph, distance = "euclidean", method = "complete")
  expect_true(ph$cluster_rows)
  expect_equal(ph$clustering_distance_rows, "euclidean")
  expect_equal(ph$clustering_method, "complete")
})
