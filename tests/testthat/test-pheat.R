x <- matrix(1:9, nrow=3, dimnames = list(c("a", "b", "c"), c("x", "y", "z")))

test_that("pheat works for matrix", {
  ph <- pheat(x)
  expect_equal(ph$mat, x)
})

test_that("pheat works for data frame with rownames", {
  xdf <- data.frame(x=1:3, y=4:6, z=7:9)
  rownames(xdf) <- c("a", "b", "c")
  ph <- pheat(xdf, rownames_in = NULL)
  expect_equal(ph$mat, x)
})

test_that("pheat works for data frame with rownames in first column", {
  xdf <- data.frame(item_id = c("a", "b", "c"), x=1:3, y=4:6, z=7:9)
  ph <- pheat(xdf)
  expect_equal(ph$mat, x)
})

test_that("pheat turns off clustering by default", {
  ph <- pheat(x)
  expect_equal(ph$cluster_rows, FALSE)
  expect_equal(ph$cluster_cols, FALSE)
})

test_that("pheat sets cellwidth, cellheight by default", {
  ph <- pheat(x)
  expect_equal(ph$cellwidth, 10)
  expect_equal(ph$cellheight, 10)
})
