getBoardChart();
getReplyChart();
getTransactionHistoryChart();
getSalesChart();



function getBoardChart() {
	let labels;
	let label;
	let datas = new Array();
	
	fetch('/admin/statistics/board')
	.then((res)=>{
		return res.json();
	})
	.then((data)=>{
		const canvas = $('#chart-board');
		labels =["일", "주", "달", "연"];
		label = "평균 게시글 수";
		for(key in data.data) {
			datas.push(data.data[key]);
		}
		makeChart(canvas, labels, label, datas);
	})
}

function getReplyChart() {
	let labels;
	let label;
	let datas = new Array();
	
	fetch('/admin/statistics/reply')
	.then((res)=>{
		return res.json();
	})
	.then((data)=>{
		const canvas = $('#chart-reply');
		labels =["일", "주", "달", "연"];
		label = "평균 댓글 수";
		for(key in data.data) {
			datas.push(data.data[key]);
		}
		makeChart(canvas, labels, label, datas);
	})
}

function getTransactionHistoryChart() {
	let labels;
	let label;
	let datas = new Array();
	
	fetch('/admin/statistics/tranhis')
	.then((res)=>{
		return res.json();
	})
	.then((data)=>{
		const canvas = $('#chart-tranhis');
		labels =["일", "주", "달", "연"];
		label = "평균 거래 수";
		for(key in data.data) {
			datas.push(data.data[key]);
		}
		makeChart(canvas, labels, label, datas);
	})
}

function getSalesChart() {
	let labels;
	let label;
	let datas = new Array();
	
	fetch('/admin/statistics/sales')
	.then((res)=>{
		return res.json();
	})
	.then((data)=>{
		const canvas = $('#chart-sales');
		labels =["일", "주", "달", "연"];
		label = "평균 매출액";
		for(key in data.data) {
			datas.push(data.data[key]);
		}
		makeChart(canvas, labels, label, datas);
	})
}

function makeChart(canvas, labels, label, datas) {
	
	const ctx = canvas.get(0).getContext('2d');
	const chart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: labels,
			datasets: [{
				label: label,
				data: datas,
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [
					'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
				],
				borderWidth: 1
			}]
		},
		options: {
        maintainAspectRatio: true,
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        },
    }
	});
}