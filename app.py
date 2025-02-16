from flask import Flask, render_template

app = Flask(__name__)

@app.route("/", methods=["GET"])
def home():
    return render_template("index.html")

#Error Handler
# Invalid URL
@app.errorhandler(404)
def page_not_found(e):
	return render_template("404.html"), 404

# Internal server error
@app.errorhandler(500)
def internal_server_error(e):
	return render_template("500.html"), 500

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port='80')
