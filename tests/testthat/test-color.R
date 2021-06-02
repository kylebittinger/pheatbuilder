x <- matrix(1:9, nrow=3, dimnames = list(c("a", "b", "c"), c("x", "y", "z")))

test_that("pheat_color default values work", {
  ph <- pheat_color(pheat(x))
  expect_false("color" %in% names(ph))
  expect_equal(ph$breaks, NA)
  expect_equal(ph$na_col, "#DDDDDD")
})

test_that("pheat_color issues warning if length of breaks is incorrect", {
  color <- c("red", "blue", "green")
  breaks <- c(0, 1, 2)
  expect_warning(pheat_color(pheat(x), color = color, breaks = breaks))
})

test_that("pheat_color sets correct attributes", {
  color <- c("red", "blue", "green")
  breaks <- c(0, 1, 2, 3)
  ph <- pheat_color(
    pheat(x), color = color, breaks = breaks, na_color = "#333333")
  expect_equal(ph$color, color)
  expect_equal(ph$breaks, breaks)
  expect_equal(ph$na_col, "#333333")
})
