var intervall = 1000;

function updateIntervall() {
    intervall = $('#intervall').val()
    localStorage.setItem('jesqueIntervall', intervall);
    return false;
}

$(document).ready(function () {
    var fromStorage = localStorage.getItem("jesqueIntervall");
    if (fromStorage) {
        intervall = fromStorage
    }

    $(".table").on("click", ".clickable", function () {
        window.location = $(this).data('target');
    });

    $('.toggle').click(function () {
        var $this = $($(this).data('target'));
        if ($this)
            if ($this.hasClass('hidden'))
                $this.removeClass('hidden');
            else
                $this.addClass('hidden');
        return false;
    })

    $('#intervall').val(intervall)
    $('#intervall').change(function () {
        updateIntervall()
    });
});

var paginate = function (pagination, options) {
    var type = options.hash.type || 'middle';
    var ret = '';
    var pageCount = pagination.pageCount;
    var page = Number(pagination.page);
    var limit;
    if (options.hash.limit) limit = +options.hash.limit;

    //page pageCount
    var newContext = {};
    switch (type) {
        case 'middle':
            if (typeof limit === 'number') {
                var i = 0;
                var leftCount = Math.ceil(limit / 2) - 1;
                var rightCount = limit - leftCount - 1;
                if (page + rightCount > pageCount)
                    leftCount = limit - (pageCount - page) - 1;
                if (page - leftCount < 1)
                    leftCount = page - 1;
                var start = page - leftCount;

                while (i < limit && i < pageCount) {
                    newContext = { n: start };
                    if (start === page) newContext.active = true;
                    ret = ret + options.fn(newContext);
                    start++;
                    i++;
                }
            }
            else {
                for (var i = 1; i <= pageCount; i++) {
                    newContext = { n: i };
                    if (i === page) newContext.active = true;
                    ret = ret + options.fn(newContext);
                }
            }
            break;
        case 'previous':
            if (page === 1) {
                newContext = { disabled: true, n: 1 }
            }
            else {
                newContext = { n: page - 1 }
            }
            ret = ret + options.fn(newContext);
            break;
        case 'next':
            newContext = {};
            if (page === pageCount) {
                newContext = { disabled: true, n: pageCount }
            }
            else {
                newContext = { n: page + 1 }
            }
            ret = ret + options.fn(newContext);
            break;
    }

    return ret;
};

var ifCond = function (v1, operator, v2, options) {

    switch (operator) {
        case '==':
            return (v1 == v2) ? options.fn(this) : options.inverse(this);
        case '===':
            return (v1 === v2) ? options.fn(this) : options.inverse(this);
        case '<':
            return (v1 < v2) ? options.fn(this) : options.inverse(this);
        case '<=':
            return (v1 <= v2) ? options.fn(this) : options.inverse(this);
        case '>':
            return (v1 > v2) ? options.fn(this) : options.inverse(this);
        case '>=':
            return (v1 >= v2) ? options.fn(this) : options.inverse(this);
        default:
            return options.inverse(this);
    }
}

var formatTimestamp = function (timestamp) {
    return new Date(parseInt(timestamp)).toLocaleString();
}

Handlebars.registerHelper('ifCond', ifCond);

Handlebars.registerHelper('paginate', paginate);

Handlebars.registerHelper('timestampDateFormat', formatTimestamp);