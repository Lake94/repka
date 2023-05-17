{
	"info": {
		"_postman_id": "76461524-a9ad-4ee2-ad04-9351ab978825",
		"name": "Dummyapi.io",
		"schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json",
		"_exporter_id": "17359265"
	},
	"item": [
		{
			"name": "Get list users (no auth)",
			"event": [
				{
					"listen": "test",
					"script": {
						"exec": [
							"pm.test(\"Status code is 403\", function () {\r",
							"    pm.response.to.have.status(403);\r",
							"});"
						],
						"type": "text/javascript"
					}
				}
			],
			"request": {
				"auth": {
					"type": "noauth"
				},
				"method": "GET",
				"header": [],
				"url": {
					"raw": "https://dummyapi.io/data/v1/user",
					"protocol": "https",
					"host": [
						"dummyapi",
						"io"
					],
					"path": [
						"data",
						"v1",
						"user"
					]
				}
			},
			"response": []
		},
		{
			"name": "Get list users (auth)",
			"event": [
				{
					"listen": "test",
					"script": {
						"exec": [
							"pm.test(\"Status code is 200\", function () {\r",
							"    pm.response.to.have.status(200);\r",
							"});"
						],
						"type": "text/javascript"
					}
				}
			],
			"request": {
				"method": "GET",
				"header": [],
				"url": {
					"raw": "https://dummyapi.io/data/v1/user",
					"protocol": "https",
					"host": [
						"dummyapi",
						"io"
					],
					"path": [
						"data",
						"v1",
						"user"
					]
				}
			},
			"response": []
		},
		{
			"name": "Pagination",
			"event": [
				{
					"listen": "test",
					"script": {
						"exec": [
							"pm.test(\"Status code is 200\", function () {\r",
							"    pm.response.to.have.status(200);\r",
							"});\r",
							"\r",
							"pm.test(\"Время отклика\", function () {\r",
							"    pm.expect(pm.response.responseTime).to.be.below(1000);\r",
							"});"
						],
						"type": "text/javascript"
					}
				}
			],
			"request": {
				"method": "GET",
				"header": [],
				"url": {
					"raw": "https://dummyapi.io/data/v1/user?page=1&limit=6",
					"protocol": "https",
					"host": [
						"dummyapi",
						"io"
					],
					"path": [
						"data",
						"v1",
						"user"
					],
					"query": [
						{
							"key": "page",
							"value": "1"
						},
						{
							"key": "limit",
							"value": "6"
						}
					]
				}
			},
			"response": []
		},
		{
			"name": "Create user",
			"event": [
				{
					"listen": "test",
					"script": {
						"exec": [
							"var jsonData = pm.response.json();\r",
							"pm.environment.set(\"Email\", jsonData.email);\r",
							"pm.environment.set(\"UserId\", jsonData.id);\r",
							"\r",
							"pm.test(\"Status code is 200\", function () {\r",
							"    pm.response.to.have.status(200);\r",
							"});\r",
							"\r",
							"pm.test(\"Проверка id\", function () {\r",
							"    pm.expect(pm.response.text()).to.include(\"id\");\r",
							"});"
						],
						"type": "text/javascript"
					}
				}
			],
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "{\r\n\"firstName\" :\"{{$randomFirstName}}\", \r\n\"lastName\" : \"{{$randomLastName}}\",\r\n\"email\" : \"{{$randomEmail}}\"\r\n}",
					"options": {
						"raw": {
							"language": "json"
						}
					}
				},
				"url": {
					"raw": "https://dummyapi.io/data/v1/user/create",
					"protocol": "https",
					"host": [
						"dummyapi",
						"io"
					],
					"path": [
						"data",
						"v1",
						"user",
						"create"
					]
				}
			},
			"response": []
		},
		{
			"name": "Update user",
			"event": [
				{
					"listen": "test",
					"script": {
						"exec": [
							"pm.test(\"Status code is 200\", function () {\r",
							"    pm.response.to.have.status(200);\r",
							"});"
						],
						"type": "text/javascript"
					}
				}
			],
			"request": {
				"method": "PUT",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "{\r\n\"firstName\" :\"Jankins\", \r\n\"lastName\" : \"Dosi\",\r\n\"email\" : \"Jankins@dosi.com\",\r\n\"phone\" : 123456789\r\n}",
					"options": {
						"raw": {
							"language": "json"
						}
					}
				},
				"url": {
					"raw": "https://dummyapi.io/data/v1/user/{{UserId}}",
					"protocol": "https",
					"host": [
						"dummyapi",
						"io"
					],
					"path": [
						"data",
						"v1",
						"user",
						"{{UserId}}"
					]
				}
			},
			"response": []
		},
		{
			"name": "Check user after update",
			"event": [
				{
					"listen": "test",
					"script": {
						"exec": [
							"pm.test(\"Status code is 200\", function () {\r",
							"    pm.response.to.have.status(200);\r",
							"});"
						],
						"type": "text/javascript"
					}
				}
			],
			"protocolProfileBehavior": {
				"disableBodyPruning": true
			},
			"request": {
				"method": "GET",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "",
					"options": {
						"raw": {
							"language": "json"
						}
					}
				},
				"url": {
					"raw": "https://dummyapi.io/data/v1/user/{{UserId}}",
					"protocol": "https",
					"host": [
						"dummyapi",
						"io"
					],
					"path": [
						"data",
						"v1",
						"user",
						"{{UserId}}"
					]
				}
			},
			"response": []
		},
		{
			"name": "Create post",
			"event": [
				{
					"listen": "test",
					"script": {
						"exec": [
							"var jsonData = pm.response.json();\r",
							"pm.environment.set(\"PostId\", jsonData.id);\r",
							"\r",
							"pm.test(\"Status code is 200\", function () {\r",
							"    pm.response.to.have.status(200);\r",
							"});\r",
							"\r",
							"pm.test(\"Проверка заголовков\", function () {\r",
							"    pm.response.to.have.header(\"Connection\");\r",
							"    pm.response.to.have.header(\"Content-Length\");\r",
							"});"
						],
						"type": "text/javascript"
					}
				}
			],
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "{\r\n\"text\": \"Я купил машину\",\r\n\"image\": \"https://randomuser.me/api/portraits/women/58.jpg\",\r\n\"likes\": 300,\r\n\"tags\": \"машина\",\r\n\"owner\": \"{{UserId}}\"\r\n}",
					"options": {
						"raw": {
							"language": "json"
						}
					}
				},
				"url": {
					"raw": "https://dummyapi.io/data/v1/post/create",
					"protocol": "https",
					"host": [
						"dummyapi",
						"io"
					],
					"path": [
						"data",
						"v1",
						"post",
						"create"
					]
				}
			},
			"response": []
		},
		{
			"name": "Check post",
			"event": [
				{
					"listen": "test",
					"script": {
						"exec": [
							"pm.test(\"Status code is 200\", function () {\r",
							"    pm.response.to.have.status(200);\r",
							"});"
						],
						"type": "text/javascript"
					}
				}
			],
			"protocolProfileBehavior": {
				"disableBodyPruning": true
			},
			"request": {
				"method": "GET",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "",
					"options": {
						"raw": {
							"language": "json"
						}
					}
				},
				"url": {
					"raw": "https://dummyapi.io/data/v1/post/{{PostId}}",
					"protocol": "https",
					"host": [
						"dummyapi",
						"io"
					],
					"path": [
						"data",
						"v1",
						"post",
						"{{PostId}}"
					]
				}
			},
			"response": []
		},
		{
			"name": "Check posts list",
			"event": [
				{
					"listen": "test",
					"script": {
						"exec": [
							"pm.test(\"Status code is 200\", function () {\r",
							"    pm.response.to.have.status(200);\r",
							"});"
						],
						"type": "text/javascript"
					}
				}
			],
			"protocolProfileBehavior": {
				"disableBodyPruning": true
			},
			"request": {
				"method": "GET",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "",
					"options": {
						"raw": {
							"language": "json"
						}
					}
				},
				"url": {
					"raw": "https://dummyapi.io/data/v1/post",
					"protocol": "https",
					"host": [
						"dummyapi",
						"io"
					],
					"path": [
						"data",
						"v1",
						"post"
					]
				}
			},
			"response": []
		},
		{
			"name": "Create comment",
			"event": [
				{
					"listen": "test",
					"script": {
						"exec": [
							"var jsonData = pm.response.json();\r",
							"pm.environment.set(\"CommentId\", jsonData.id);\r",
							"\r",
							"pm.test(\"Status code is 200\", function () {\r",
							"    pm.response.to.have.status(200);\r",
							"});"
						],
						"type": "text/javascript"
					}
				}
			],
			"request": {
				"method": "POST",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "{\r\n\"message\": \"Всем привет\",\r\n\"owner\": \"{{UserId}}\",\r\n\"post\": \"{{PostId}}\"\r\n}",
					"options": {
						"raw": {
							"language": "json"
						}
					}
				},
				"url": {
					"raw": "https://dummyapi.io/data/v1/comment/create",
					"protocol": "https",
					"host": [
						"dummyapi",
						"io"
					],
					"path": [
						"data",
						"v1",
						"comment",
						"create"
					]
				}
			},
			"response": []
		},
		{
			"name": "Check comment",
			"event": [
				{
					"listen": "test",
					"script": {
						"exec": [
							"pm.test(\"Status code is 200\", function () {\r",
							"    pm.response.to.have.status(200);\r",
							"});"
						],
						"type": "text/javascript"
					}
				}
			],
			"protocolProfileBehavior": {
				"disableBodyPruning": true
			},
			"request": {
				"method": "GET",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "",
					"options": {
						"raw": {
							"language": "json"
						}
					}
				},
				"url": {
					"raw": "https://dummyapi.io/data/v1/user/{{UserId}}/comment",
					"protocol": "https",
					"host": [
						"dummyapi",
						"io"
					],
					"path": [
						"data",
						"v1",
						"user",
						"{{UserId}}",
						"comment"
					]
				}
			},
			"response": []
		},
		{
			"name": "Delete comment",
			"event": [
				{
					"listen": "test",
					"script": {
						"exec": [
							"pm.test(\"Status code is 200\", function () {\r",
							"    pm.response.to.have.status(200);\r",
							"});"
						],
						"type": "text/javascript"
					}
				}
			],
			"request": {
				"method": "DELETE",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "",
					"options": {
						"raw": {
							"language": "json"
						}
					}
				},
				"url": {
					"raw": "https://dummyapi.io/data/v1/comment/{{CommentId}}",
					"protocol": "https",
					"host": [
						"dummyapi",
						"io"
					],
					"path": [
						"data",
						"v1",
						"comment",
						"{{CommentId}}"
					]
				}
			},
			"response": []
		},
		{
			"name": "Check comment after delete",
			"event": [
				{
					"listen": "test",
					"script": {
						"exec": [
							"pm.test(\"Status code is 200\", function () {\r",
							"    pm.response.to.have.status(200);\r",
							"});"
						],
						"type": "text/javascript"
					}
				}
			],
			"protocolProfileBehavior": {
				"disableBodyPruning": true
			},
			"request": {
				"method": "GET",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "",
					"options": {
						"raw": {
							"language": "json"
						}
					}
				},
				"url": {
					"raw": "https://dummyapi.io/data/v1/user/{{UserId}}/comment",
					"protocol": "https",
					"host": [
						"dummyapi",
						"io"
					],
					"path": [
						"data",
						"v1",
						"user",
						"{{UserId}}",
						"comment"
					]
				}
			},
			"response": []
		},
		{
			"name": "Delete user",
			"event": [
				{
					"listen": "test",
					"script": {
						"exec": [
							"pm.test(\"Status code is 200\", function () {\r",
							"    pm.response.to.have.status(200);\r",
							"});"
						],
						"type": "text/javascript"
					}
				}
			],
			"request": {
				"method": "DELETE",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "",
					"options": {
						"raw": {
							"language": "json"
						}
					}
				},
				"url": {
					"raw": "https://dummyapi.io/data/v1/user/{{UserId}}",
					"protocol": "https",
					"host": [
						"dummyapi",
						"io"
					],
					"path": [
						"data",
						"v1",
						"user",
						"{{UserId}}"
					]
				}
			},
			"response": []
		},
		{
			"name": "Check user after delete",
			"event": [
				{
					"listen": "test",
					"script": {
						"exec": [
							"pm.test(\"Status code is 404\", function () {\r",
							"    pm.response.to.have.status(404);\r",
							"});"
						],
						"type": "text/javascript"
					}
				}
			],
			"protocolProfileBehavior": {
				"disableBodyPruning": true
			},
			"request": {
				"method": "GET",
				"header": [],
				"body": {
					"mode": "raw",
					"raw": "",
					"options": {
						"raw": {
							"language": "json"
						}
					}
				},
				"url": {
					"raw": "https://dummyapi.io/data/v1/user/{{UserId}}",
					"protocol": "https",
					"host": [
						"dummyapi",
						"io"
					],
					"path": [
						"data",
						"v1",
						"user",
						"{{UserId}}"
					]
				}
			},
			"response": []
		}
	],
	"auth": {
		"type": "apikey",
		"apikey": [
			{
				"key": "value",
				"value": "643a9038e26e526cfd375538",
				"type": "string"
			},
			{
				"key": "key",
				"value": "app-id",
				"type": "string"
			}
		]
	},
	"event": [
		{
			"listen": "prerequest",
			"script": {
				"type": "text/javascript",
				"exec": [
					""
				]
			}
		},
		{
			"listen": "test",
			"script": {
				"type": "text/javascript",
				"exec": [
					""
				]
			}
		}
	]
}