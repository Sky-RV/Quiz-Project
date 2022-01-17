var express = require('express')
var router = express.Router();
const authMiddleware = require("../../middleware/authMiddleware");

const {UniversityController,UserController,CourseController} = require("../../controllers/normal")
router.post('/university/create',UniversityController.Create)


router.post('/user/create',UserController.Create)
router.use(authMiddleware.admin)


router.get('/user/list',UserController.List)
router.get('/user/my', UserController.GetMyUser);


router.post('/course/create',CourseController.Create)
module.exports = router;