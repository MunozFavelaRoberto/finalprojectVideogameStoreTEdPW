const { Router } = require("express");
//const { validateJWT } = require("../middleware/validar-jwt");
const {
  cart_itemGet,
  cart_itemPost,
  cart_itemDelete,
} = require("../controllers/cart_item");

const router = Router();

router.post("/add", cart_itemPost);
router.get("/:id", cart_itemGet);
router.delete("/delete/:id", cart_itemDelete);
// router.put("/:id", userPut);
module.exports = router;
