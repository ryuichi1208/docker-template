from flask import Flask, jsonify, request
import json
app = Flask(__name__)

@app.route("/", methods=['GET'])
def hello():
    return "Hello World!"

@app.route("/test", methods=['GET'])
def ret_j():
    result = {
      "Content-Type": "application/json",
      "Answer":{"Text": "aaa"}
    }
    return jsonify(result)

@app.route('/reply', methods=['POST'])
def reply():
    data = json.loads(request.data)
    answer = "Yes, it is %s!\n" % data["keyword"]
    result = {
      "Content-Type": "application/json",
      "Answer":{"Text": answer}
    }
    # return answer
    return jsonify(result)

if __name__ == "__main__":
    app.run(host='0.0.0.0',port=5000,debug=True)
