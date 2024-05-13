test_that("lookup country codes works", {
  expect_equal(
    lookup_country(get_country_list()[166],"M49"),578
  )
})
