function setup_example(rulesTextArea, queryInput, queryButton, resultDiv) {
    function replace_result(elem) {
        resultDiv.parentNode.replaceChild(elem, resultDiv);
        resultDiv = elem;
    }

    function show_simple_result(str) {
        var newDiv = document.createElement("div");
        newDiv.className = "result";
        newDiv.appendChild(document.createTextNode(str));
        replace_result(newDiv);
    }

    function show_answers(answers) {
        var keys = Array.from(answers[0].keys());
        var table = document.createElement("table");
        var thead = document.createElement("thead");
        for (var k of keys) {
            var th = document.createElement("th");
            th.appendChild(document.createTextNode(k[1]));
            thead.appendChild(th);
        }
        table.appendChild(thead);

        var tbody = document.createElement("tbody");
        for (var answer of answers) {
            var tr = document.createElement("tr");

            for (var key of keys) {
                var td = document.createElement("td");
                td.appendChild(document.createTextNode(answer.subst(key)));
                tr.appendChild(td);
            }

            tbody.appendChild(tr);
        }

        table.appendChild(tbody);

        var newDiv = document.createElement("div");
        newDiv.className = "result";
        newDiv.appendChild(table);
        replace_result(newDiv);
    }

    queryButton.addEventListener(
        "click",
        function() {
            var ctx = new Datalog.SingleFileContext(rulesTextArea.value);

            if (!ctx.db) {
                show_simple_result("Syntax Error in Rules");
                return;
            }

            var answers = ctx.query(queryInput.value);

            if (answers === false) {
                show_simple_result("Syntax Error in Query");
                return;
            }

            if (answers.length === 0) {
                show_simple_result("false");
                return;
            } else if ((answers.length === 1) && (answers[0] === Datalog.nil)) {
                show_simple_result("true");
                return;
            }

            show_answers(answers);
            return;
        });
}


window.addEventListener(
    'load',
    function() {
        for (let example of document.querySelectorAll("div.example")) {
            setup_example(
                example.querySelectorAll("textarea")[0],
                example.querySelectorAll("input")[0],
                example.querySelectorAll("button")[0],
                example.querySelectorAll("div.result")[0]);
        }
    });
