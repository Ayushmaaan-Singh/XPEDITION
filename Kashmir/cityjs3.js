var nextBtn = document.querySelector('.next'),
    prevBtn = document.querySelector('.prev'),
    carousel = document.querySelector('.carousel'),
    list = document.querySelector('.list'), 
    item = document.querySelectorAll('.item'),
    runningTime = document.querySelector('.carousel .timeRunning') 

let timeRunning = 3000 

nextBtn.onclick = function(){
    showSlider('next')
}

prevBtn.onclick = function(){
    showSlider('prev')
}

let runTimeOut 

function resetTimeAnimation() {
    runningTime.style.animation = 'none'
    runningTime.offsetHeight /* trigger reflow */
    runningTime.style.animation = null 
    runningTime.style.animation = 'runningTime 7s linear 1 forwards'
}

function showSlider(type) {
    let sliderItemsDom = list.querySelectorAll('.carousel .list .item')
    if(type === 'next'){
        list.appendChild(sliderItemsDom[0])
        carousel.classList.add('next')
    } else{
        list.prepend(sliderItemsDom[sliderItemsDom.length - 1])
        carousel.classList.add('prev')
    }

    clearTimeout(runTimeOut)

    runTimeOut = setTimeout( () => {
        carousel.classList.remove('next')
        carousel.classList.remove('prev')
    }, timeRunning)

    // Remove or comment out the following lines to disable automatic sliding:
    // clearTimeout(runNextAuto)
    // runNextAuto = setTimeout(() => {
    //     nextBtn.click()
    // }, timeAutoNext)

    resetTimeAnimation() // Reset the running time animation
}

/*function showSlider(type) {
    let sliderItemsDom = list.querySelectorAll('.carousel .list .item');

    if(type === 'next'){
        list.appendChild(sliderItemsDom[0]);
        carousel.classList.add('next');
    } else {
        list.prepend(sliderItemsDom[sliderItemsDom.length - 1]);
        carousel.classList.add('prev');
    }

    // Update blur effect by adding/removing a class
    sliderItemsDom.forEach((item, index) => {
        if (index === 0) {
            item.style.filter = 'blur(0)'; // Remove blur from the active item
        } else {
            item.style.filter = 'blur(5px)'; // Apply blur to other items
        }
    });

    clearTimeout(runTimeOut);

    runTimeOut = setTimeout(() => {
        carousel.classList.remove('next');
        carousel.classList.remove('prev');
    }, timeRunning);

    resetTimeAnimation(); // Reset the running time animation
}

// Start the initial animation 
resetTimeAnimation();*/


// Start the initial animation 
resetTimeAnimation()
