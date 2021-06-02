x <- matrix(1:9, nrow=3, dimnames = list(c("a", "b", "c"), c("x", "y", "z")))

test_that("pheat_display_main sets default values", {
  ph <- pheat_display_main(pheat(x))
  expect_equal(ph$border_color, "grey60")
  expect_equal(ph$fontsize, 10)
  expect_equal(ph$main, NA)
})

test_that("pheat_display_main sets attributes correctly", {
  ph <- pheat_display_main(
    pheat(x), border_color = "#666666", fontsize = 20, title = "Hello there")
  expect_equal(ph$border_color, "#666666")
  expect_equal(ph$fontsize, 20)
  expect_equal(ph$main, "Hello there")
})

test_that("pheat_display_rows does not store fontsize if not given", {
  ph <- pheat_display_rows(pheat(x))
  expect_equal(ph$cellheight, 10)
  expect_equal(ph$show_rownames, TRUE)
  expect_false("fontsize_row" %in% names(ph))
  expect_equal(ph$gaps_row, NULL)
  expect_equal(ph$labels_row, NULL)
})

test_that("pheat_display_rows sets correct attributes", {
  ph <- pheat_display_rows(
    pheat(x), height = 25, show_names = FALSE, fontsize = 20, gaps = 1:2,
    labels = c("ROWS", "ROWS", "ROWS"))
  expect_equal(ph$cellheight, 25)
  expect_equal(ph$show_rownames, FALSE)
  expect_equal(ph$fontsize_row, 20)
  expect_equal(ph$gaps_row, 1:2)
  expect_equal(ph$labels_row, c("ROWS", "ROWS", "ROWS"))
})

test_that("pheat_display_cols does not store fontsize if not given", {
  ph <- pheat_display_cols(pheat(x))
  expect_equal(ph$cellwidth, 10)
  expect_equal(ph$show_colnames, TRUE)
  expect_false("fontsize_col" %in% names(ph))
  expect_equal(ph$gaps_col, NULL)
  expect_equal(ph$labels_col, NULL)
})

test_that("pheat_display_cols sets correct attributes", {
  ph <- pheat_display_cols(
    pheat(x), width = 25, show_names = FALSE, fontsize = 20, gaps = 1:2,
    labels = c("COLS", "COLS", "COLS"))
  expect_equal(ph$cellwidth, 25)
  expect_equal(ph$show_colnames, FALSE)
  expect_equal(ph$fontsize_col, 20)
  expect_equal(ph$gaps_col, 1:2)
  expect_equal(ph$labels_col, c("COLS", "COLS", "COLS"))
})
