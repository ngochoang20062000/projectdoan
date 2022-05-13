const filterProduct = () => {
    let fromPrice = document.getElementById("fromPrice").value;
    let toPrice = document.getElementById("toPrice").value;

    if (!fromPrice && !toPrice) {
        toastr.error('Vui lòng nhập giá trước khi lọc', 'Lỗi');
        return;
    }

    if (Number(fromPrice) < 0) {
        fromPrice *= -1;
    }
    if (Number(toPrice) < 0) {
        toPrice *= -1;
    }

    let url;
    const { search, pathname } = window.location;

    if (!search) {
        url = `${pathname}?fromPrice=${fromPrice}&toPrice=${toPrice}`;
    } else {
        if (search.indexOf("order=asc") !== -1) {
            url = `${pathname}?order=asc&fromPrice=${fromPrice}&toPrice=${toPrice}`;
        } else if (search.indexOf("order=desc") !== -1) {
            url = `${pathname}?order=desc&fromPrice=${fromPrice}&toPrice=${toPrice}`;
        } else {
            url = `${pathname}${search}&fromPrice=${fromPrice}&toPrice=${toPrice}`;
        }
    }

    window.location = url;
}
const onSort = () => {
    const { value } = document.getElementById("filter");
    document.getElementById("viewbag").value = value;
    let url;
    let { search, pathname } = window.location;
    search = search.replace("?order=asc", "");
    search = search.replace("?order=desc", "");
    search = search.replace("&order=asc", "");
    search = search.replace("&order=desc", "");
    search = search.replace("&order=default", "");
    search = search.replace("?order=default", "");

    if (!search) {
        url = `${pathname}?order=${value}`;
    } else if (search.indexOf("?") === -1) {
        url = `${pathname}?order=${value}${search}`;
    } else {
        url = `${pathname}${search}&order=${value}`;
    }

    window.location = url;
}

const clearFilter = () => {
    window.location = window.location.pathname;
}

const getSelectedCheckboxValues = (name) => {
    const checkboxes = document.querySelectorAll(`input[name="${name}"]:checked`);
    let values = [];
    checkboxes.forEach((checkbox) => {
        values.push(checkbox.value);
    });
    return values;
}

const btn = document.querySelector('#cate-filter');

btn.addEventListener('click', (event) => {
    const categoryIds = getSelectedCheckboxValues('category').toString();
    let idsExists = document.getElementById("cate-hidden").value;

    let url;
    let { search, pathname } = window.location;

    search = search.replace(`?category=${idsExists}`, "");
    search = search.replace(`&category=${idsExists}`, "");
    search = search.replaceAll("%2C", ",").replace(`?category=${idsExists}`, "");
    search = search.replaceAll("%2C", ",").replace(`&category=${idsExists}`, "");

    if (!search) {
        url = `${pathname}?category=${categoryIds}`;
    } else {
        url = `${pathname}${search}&category=${categoryIds}`;
    }

    if (!categoryIds) {
        search = search.replace(`?category=${idsExists}`, "");
        url = `${pathname}${search}`;
    }

    window.location = url;
});

const onloadSelected = () => {
    const { search } = window.location;
    if (search.indexOf("order=asc") !== -1) {
        document.getElementById("hdk-asc").selected = true;
        document.getElementById("viewbag").value = "asc";
    } else if (search.indexOf("order=desc") !== -1) {
        document.getElementById("hdk-desc").selected = true;
        document.getElementById("viewbag").value = "desc";
    } else {
        document.getElementById("hdk-default").selected = true;
        document.getElementById("viewbag").value = "default";
    }

    const idsExists = document.getElementById("cate-hidden").value;
    const ids = idsExists.split(",");

    ids.map(id => {
        document.getElementById(`cate-${id}`).checked = true
    });
}

onloadSelected();