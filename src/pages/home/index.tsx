import React from 'react'
import { test } from '@commonFunc/commonFunc'
import logo from "@assets/images/logo.jpg"

export default () => {
  test()
  return (
    <div>
      <h1>Home</h1>
      <img src={logo} />
    </div>
  )
}